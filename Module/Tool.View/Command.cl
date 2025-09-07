class Command : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.Size.Width : this.Icon.Size.Count;
        this.Size.Hegth : this.Icon.Size.Count;
        return true;
    }

    field prusate Icon Icon { get { return data; } set { data : value; } }

    maide prusate Bool Execute()
    {
        return true;
    }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        this.DrawRectA.Pos.Col : this.Pos.Col;
        this.DrawRectA.Pos.Row : this.Pos.Row;
        this.DrawRectA.Size.Width : this.Icon.Size.Count;
        this.DrawRectA.Size.Hegth : this.Icon.Size.Count;

        this.DrawRectB.Pos.Col : 0;
        this.DrawRectB.Pos.Row : 0;
        this.DrawRectB.Size.Width : this.Icon.Size.Count;
        this.DrawRectB.Size.Hegth : this.Icon.Size.Count;

        draw.ExecuteImage(this.Icon.Image, this.DrawRectA, this.DrawRectB);
        return true;
    }
}