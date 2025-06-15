class Panel : Grid
{
    maide prusate Bool Init()
    {
        base.Init();

        var Int count;
        count : this.Command.Count;

        var Int wed;
        wed : 16 + 4;

        var Int het;
        het : 16 + 4;

        var Count col;
        col : new Count;
        col.Init();
        col.Value : wed;

        var Count row;
        row : new Count;
        row.Init();
        row.Value : het;

        var Int i;
        i : 0;
        while (i < count)
        {
            this.Col.Add(col);

            i : i + 1;
        }

        this.Row.Add(row);

        i : 0;
        while (i < count)
        {
            var Command command;
            command : cast Command(this.Command.Get(i));
            command.Pos.Col : 4;
            command.Pos.Row : 2;

            var GridChild child;
            child : new GridChild;
            child.Init();
            child.Rect.Pos.Col : i;
            child.Rect.Pos.Row : 0;
            child.Rect.Size.Wed : 1;
            child.Rect.Size.Het : 1;
            child.View : command;

            this.ChildList.Add(child);

            i : i + 1;
        }

        this.Back : this.Palete.Back;

        this.Size.Wed : count * wed;
        this.Size.Het : het;

        return true;
    }

    field prusate Array Command { get { return data; } set { data : value; } }
}