class Table : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ToolViewInfra : share ToolViewInfra;
        return true;
    }

    field precate Infra ToolViewInfra { get { return data; } set { data : value; } }

    field prusate Array Part { get { return data; } set { data : value; } }

    maide precate Bool ExecuteDrawThis(var Draw draw)
    {
        var DrawImage image;
        image : this.ToolViewInfra.ImagePartTable;

        this.DrawRectA.Pos.Col : 0;
        this.DrawRectA.Pos.Row : 0;
        this.DrawRectA.Size.Wed : image.Size.Wed;
        this.DrawRectA.Size.Het : image.Size.Het;

        this.DrawRectB.Pos.Col : 0;
        this.DrawRectB.Pos.Row : 0;
        this.DrawRectB.Size.Wed : image.Size.Wed;
        this.DrawRectB.Size.Het : image.Size.Het;

        draw.ExecuteImage(this.ToolView. this.DrawRectA, this.DrawRectB);

        return true;
    }
}