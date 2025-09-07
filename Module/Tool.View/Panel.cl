class Panel : Grid
{
    field prusate Array Command { get { return data; } set { data : value; } }

    maide prusate Bool Set()
    {
        var Int count;
        count : this.Command.Count;

        var Int width;
        width : 16 + 9;

        var Int hegth;
        hegth : 16 + 4;

        var Count row;
        row : new Count;
        row.Init();
        row.Value : hegth;

        var Int i;
        i : 0;
        while (i < count)
        {
            var Count col;
            col : new Count;
            col.Init();
            col.Value : width;

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
            child.Rect.Size.Width : 1;
            child.Rect.Size.Hegth : 1;
            child.View : command;

            this.ChildList.Add(child);

            i : i + 1;
        }

        this.Back : this.Palete.Back.Brush;

        this.Size.Width : count * width;
        this.Size.Hegth : hegth;

        return true;
    }
}