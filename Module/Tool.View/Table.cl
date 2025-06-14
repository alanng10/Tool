class Table : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ToolViewInfra : share ToolViewInfra;

        this.IndexField : this.CreateIndexField();
        return true;
    }

    maide precate Field CreateIndexField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    field prusate Array Part { get { return data; } set { data : value; } }
    field precate Infra ToolViewInfra { get { return data; } set { data : value; } }

    field prusate Field IndexField { get { return data; } set { data : value; } }

    field prusate Int Index
    {
        get
        {
            return cast Int(this.IndexField.GetAny());
        }
        set
        {
            this.IndexField.SetAny(value);
        }
    }

    maide precate Bool ModIndex(var Mod mod)
    {
        this.Event(this.IndexField);

        this.Child : cast View(this.List.Get(this.Index));
        return true;
    }

    maide precate Bool ValidDraw()
    {
        inf (~base.ValidDraw())
        {
            return false;
        }

        var Part part;
        part : cast Part(this.Part.Get(this.Index));

        return ~(part = null);
    }

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