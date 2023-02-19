using System;
using Godot;

namespace TicTacToe;

public partial class Board : GodotObject
{
    public Board()
    {
        Fields = new Field[3][];

        Fields[0] = new Field[3] { new Field(), new Field(), new Field() };
        Fields[1] = new Field[3] { new Field(), new Field(), new Field() };
        Fields[2] = new Field[3] { new Field(), new Field(), new Field() };
    }

    public Field Mark(int x, int y, string player)
    {
        if (x is < 1 or > 3 || y is < 1 or > 3)
            throw new ArgumentException("X and Y need to be between 1-3");

        if (!string.IsNullOrEmpty(Fields[x - 1][y - 1].Mark))
            throw new ArgumentException("Field is already marked");


        var field = new Field { Mark = player };

        Fields[x - 1][y - 1] = field;

        return field;
    }

    public string GetResult()
    {
        if (Fields[0][0].Equals(Fields[0][1]) && Fields[0][0].Equals(Fields[0][2]))
            return Fields[0][0].Mark;
        if (Fields[1][0].Equals(Fields[1][1]) && Fields[1][0].Equals(Fields[1][2]))
            return Fields[1][0].Mark;
        if (Fields[2][0].Equals(Fields[2][1]) && Fields[2][0].Equals(Fields[2][2]))
            return Fields[2][0].Mark;

        if (Fields[0][0].Equals(Fields[1][0]) && Fields[0][0].Equals(Fields[2][0]))
            return Fields[0][0].Mark;
        if (Fields[0][1].Equals(Fields[1][1]) && Fields[0][1].Equals(Fields[2][1]))
            return Fields[0][1].Mark;
        if (Fields[0][2].Equals(Fields[1][2]) && Fields[0][2].Equals(Fields[2][2]))
            return Fields[0][2].Mark;


        if (Fields[0][0].Equals(Fields[1][1]) && Fields[0][0].Equals(Fields[2][2]))
            return Fields[0][0].Mark;
        if (Fields[0][2].Equals(Fields[1][1]) && Fields[0][2].Equals(Fields[2][0]))
            return Fields[0][2].Mark;

        return "";
    }

    public Field[][] Fields { get; }
}

