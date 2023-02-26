using System;
using Godot;
using Range = System.Range;

public partial class DraftApi : Node
{
	private static string[] names = new[]
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
}
