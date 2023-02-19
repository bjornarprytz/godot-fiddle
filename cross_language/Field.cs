using Godot;

namespace TicTacToe;

public partial class Field : GodotObject
{
    public string Mark { get; set; } = "";

    public override bool Equals(object obj)
    {
        if (obj is not Field f)
            return false;

        if (Mark == "")
            return false;

        return f.Mark == Mark;
    }
}
