class Table : View
{
    maide prusate Bool Init()
    {
        base.Init();
        this.ToolViewInfra : share Infra;
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
        image : this.ToolViewInfra.ImageTableHeadLite;

        var Int iconPosSpace;
        iconPosSpace : 4;

        this.DrawRectA.Pos.Col : this.Pos.Col;
        this.DrawRectA.Pos.Row : this.Pos.Row;
        this.DrawRectA.Size.Wed : image.Size.Wed;
        this.DrawRectA.Size.Het : image.Size.Het;

        this.DrawRectB.Pos.Col : 0;
        this.DrawRectB.Pos.Row : 0;
        this.DrawRectB.Size.Wed : image.Size.Wed;
        this.DrawRectB.Size.Het : image.Size.Het;

        draw.ExecuteImage(image, this.DrawRectA, this.DrawRectB);

        var Part part;
        part : cast Part(this.Part.Get(this.Index));

        var Int nameCount;
        nameCount : this.StringComp.Count(part.Name);

        var Int ka;
        ka : iconPosSpace + part.Icon.Size.Count + 5 + nameCount * 8;

        var Int midWed;
        midWed : ka;
        midWed : midWed - image.Size.Wed;

        draw.Fill : this.ToolViewInfra.BrushTableHeadMid;

        this.DrawRectA.Pos.Col : this.Pos.Col + image.SizeWed;
        this.DrawRectA.Pos.Row : this.Pos.Row;
        this.DrawRectA.Size.Wed : midWed;
        this.DrawRectA.Size.Het : this.ToolViewInfra.ImageTableHeadMid.Size.Het;

        draw.ExecuteRect(this.DrawRectA);

        draw.Fill : null;

        var DrawImage image;
        image : this.ToolViewInfra.ImageTableHeadRite;

        this.DrawRectA.Pos.Col : this.Pos.Col + ka;
        this.DrawRectA.Pos.Row : this.Pos.Row;
        this.DrawRectA.Size.Wed : image.Size.Wed;
        this.DrawRectA.Size.Het : image.Size.Het;

        this.DrawRectB.Pos.Col : 0;
        this.DrawRectB.Pos.Row : 0;
        this.DrawRectB.Size.Wed : image.Size.Wed;
        this.DrawRectB.Size.Het : image.Size.Het;

        draw.ExecuteImage(image, this.DrawRectA, this.DrawRectB);

        this.DrawRectA.Pos.Col : this.Pos.Col + iconPosSpace;
        this.DrawRectA.Pos.Row : this.Pos.Row + iconPosSpace;
        this.DrawRectA.Size.Wed : part.Icon.Size.Count;
        this.DrawRectA.Size.Het : part.Icon.Size.Count;

        this.DrawRectB.Pos.Col : 0;
        this.DrawRectB.Pos.Row : 0;
        this.DrawRectB.Size.Wed : part.Icon.Size.Count;
        this.DrawRectB.Size.Het : part.Icon.Size.Count;

        draw.ExecuteImage(part.Icon.Image, this.DrawRectA, this.DrawRectB);

        this.StringData.ValueString : part.Name;

        this.Text.Data : this.StringData;
        this.Text.Range.Index : 0;
        this.Text.Range.Count : this.StringComp.Count(part.Name);

        this.DrawRectA.Pos.Col : this.Pos.Col + iconPosSpace + part.Icon.Size.Count + 5;
        this.DrawRectA.Pos.Row : this.Pos.Row + 5;
        this.DrawRectA.Size.Wed : 8 * this.Text.Range.Count;
        this.DrawRectA.Size.Het : 15;

        draw.Font : this.Palete.FontMono;

        draw.Line : this.DrawInfra.SlashWhite;

        draw.ExecuteText(this.Text, this.DrawAlignList.Start, this.DrawAlignList.Start, false, this.DrawRectA, null);

        draw.Line : null;

        draw.Font : null;

        this.Text.Data : null;

        this.StringData.ValueString : null;

        return true;
    }
}