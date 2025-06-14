class Table : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ToolViewInfra : share ToolViewInfra;
        this.StringComp : share StringComp;
        this.DrawAlignList : share DrawAlignList;

        this.IndexField : this.CreateIndexField();
        this.Text : this.CreateText();
        this.StringData : this.CreateStringData();
        return true;
    }

    maide precate Field CreateIndexField()
    {
        return this.ViewInfra.FieldCreate(this);
    }

    maide precate TextText CreateText()
    {
        var TextText a;
        a : new TextText;
        a.Init();
        a.Range : new Range;
        a.Range.Init();
        return a;
    }

    maide precate StringData CreateStringData()
    {
        var StringData a;
        a : new StringData;
        a.Init();
        return a;
    }

    field prusate Array Part { get { return data; } set { data : value; } }
    field precate Infra ToolViewInfra { get { return data; } set { data : value; } }
    field precate StringComp StringComp { get { return data; } set { data : value; } }
    field precate DrawAlignList DrawAlignList { get { return data; } set { data : value; } }
    field precate TextText Text { get { return data; } set { data : value; } }
    field precate StringData StringData { get { return data; } set { data : value; } }

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

        draw.ExecuteImage(image, this.DrawRectA, this.DrawRectB);

        var Part part;
        part : cast Part(this.Part.Get(this.Index));

        this.StringData.ValueString : part.Name;

        this.Text.Data : this.StringData;
        this.Text.Range.Index : 0;
        this.Text.Range.Count : this.StringComp.Count(part.Name);

        image : part.Icon.Image;

        this.DrawRectA.Pos.Col : 5;
        this.DrawRectA.Pos.Row : 5;
        this.DrawRectA.Size.Wed : image.Size.Wed;
        this.DrawRectA.Size.Het : image.Size.Het;

        this.DrawRectB.Pos.Col : 0;
        this.DrawRectB.Pos.Row : 0;
        this.DrawRectB.Size.Wed : image.Size.Wed;
        this.DrawRectB.Size.Het : image.Size.Het;

        draw.ExecuteImage(image, this.DrawRectA, this.DrawRectB);

        draw.ExecuteText(this.Text, this.DrawAlignList.Start, this.DrawAlignList.Start, false, )

        return true;
    }
}