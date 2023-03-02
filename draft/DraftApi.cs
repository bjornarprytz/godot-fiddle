using System;
using Godot;
using Godot.Fiddle.CardResolver;
using TicTacToe;

public partial class DraftApi : Node
{
	private static string[] names = 
	{
		"Frostbite Axe",
		"Valkyrie's Aid",
		"Thor's Mallet",
		"Frost Serpent",
		"Protection Rune",
		"Odin's Gift",
		"Winter's Bite",
		"Jotun's Fury",
		"Yggdrasil's Sap",
		"Berserker's Axe",
	};
	
	private readonly PackedScene _draftCardFactory = (PackedScene)GD.Load("res://draft/card_draft.tscn");

	public GodotObject[] GetPicks()
	{
		const int nPicks = 3;
		
		var cards = new GodotObject[nPicks];

		for (var i=0; i < nPicks; i++)
		{
			var card = _draftCardFactory.Instantiate();
			
			var random = new Random();
			var randomIndex = random.Next(names.Length);
			card.Set("cardName", names[randomIndex]);
			
			card.Call("update_ui");
			
			GD.Print($"Created card with name {names[randomIndex]}");

			cards[i] = card;
		}

		return cards;
	}

	public void PlayCard(GodotObject card, GodotObject enemy)
	{
		var rCard = new Card
		{
			Keyword = "Damage",
			Strength = 69,
		};

		var rEnemy = new Enemy(enemy);
		
		Resolve.Card(rCard, rEnemy);
	}
	
	internal class Enemy : IEnemy
	{
		private readonly GodotObject _enemy;

		public Enemy(GodotObject enemy)
		{
			_enemy = enemy;
		}

		public int Health
		{
			get => (int) _enemy.Get("health");
			set => _enemy.Set("health", value);
		}
	}
	
	internal class Card : ICard
	{
		public string Keyword { get; init; }
		public int Strength { get; init; }
	}
}
