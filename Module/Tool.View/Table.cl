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
        var Int iconPos;
        iconPos : 4;

        var DrawImage image;

        var Part part;

        var Int nameCount;

        var Int col;
        col : 0;

        var Int i;
        i : 0;
        while (i < this.Index)
        {
            part : cast Part(this.Part.Get(i));

            nameCount : this.StringComp.Count(part.Name);

            var Bool b;
            b : i = 0;
            inf (b)
            {
                image : this.ToolViewInfra.ImageTableHeadBeforeLite;
            }
            inf (~b)
            {
                image : this.ToolViewInfra.ImageTableHeadBeforeLite2;
            }

            this.ExecuteDrawHeadImage(draw, image, col, 0);

            var Int ka;
            ka : iconPos + part.Icon.Size.Count + 5 + nameCount * 8 + 12;

            this.ExecuteDrawHeadMid(draw, this.ToolViewInfra.BrushTableHeadBeforeMid, col, ka, image.Size.Wed);

            this.ExecuteDrawHeadIcon(draw, part, col, iconPos, iconPos);

            this.ExecuteDrawHeadName(draw, part, col, iconPos);

            col : col + kaa;

            i : i + 1;
        }

        inf (0 < i)
        {
            this.ExecuteDrawHeadImage(draw, this.ToolViewInfra.ImageTableHeadBeforeRite, col, 0);

            col : col + this.ToolViewInfra.ImageTableHeadBeforeRite.Size.Wed;
        }

        part : cast Part(this.Part.Get(this.Index));

        nameCount : this.StringComp.Count(part.Name);

        image : this.ToolViewInfra.ImageTableHeadLite;

        this.ExecuteDrawHeadImage(draw, image, col, 0);

        this.ExecuteDrawHeadMid(draw, this.ToolViewInfra.BrushTableHeadMid, nameCount, col, iconPos, image.Size.Wed, 0);

        image : this.ToolViewInfra.ImageTableHeadRite;

        this.ExecuteDrawHeadImage(draw, image, col, 0);

        this.ExecuteDrawHeadIcon(part, 0);

        return true;
    }

    maide precate Bool ExecuteDrawHeadMid(var Draw draw, var DrawBrush brush, var Int col, var Int wed, var Int beforeWed)
    {
        var Int midWed;
        midWed : wed;
        midWed : midWed - beforeWed;

        draw.Fill : brush;

        draw.FillPos.Col : this.MathInt(this.Pos.Col);
        draw.FillPos.Row : this.MathInt(this.Pos.Row);
        draw.FillPosSet();

        this.DrawRectA.Pos.Col : this.Pos.Col + col + beforeWed;
        this.DrawRectA.Pos.Row : this.Pos.Row;
        this.DrawRectA.Size.Wed : midWed;
        this.DrawRectA.Size.Het : brush.Image.Size.Het;

        draw.ExecuteRect(this.DrawRectA);

        draw.Fill : null;
        return true;
    }

    maide precate Bool ExecuteDrawHeadIcon(var Draw draw, var Part part, var Int col, var Int iconCol, var Int iconRow)
    {
        this.ExecuteDrawHeadImage(draw, part.Icon.Image, col + iconCol, iconRow);
        return true;
    }

    maide precate Bool ExecuteDrawHeadName(var Draw draw, var Part part, var Int col, var Int iconCol)
    {
        this.StringData.ValueString : part.Name;

        this.Text.Data : this.StringData;
        this.Text.Range.Index : 0;
        this.Text.Range.Count : this.StringComp.Count(part.Name);

        this.DrawRectA.Pos.Col : this.Pos.Col + col + iconCol + part.Icon.Size.Count + 5;
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

    maide precate Bool ExecuteDrawHeadImage(var Draw draw, var DrawImage image, var Int col, var Int row)
    {
        this.DrawRectA.Pos.Col : this.Pos.Col + col;
        this.DrawRectA.Pos.Row : this.Pos.Row + row;
        this.DrawRectA.Size.Wed : image.Size.Wed;
        this.DrawRectA.Size.Het : image.Size.Het;

        this.DrawRectB.Pos.Col : 0;
        this.DrawRectB.Pos.Row : 0;
        this.DrawRectB.Size.Wed : image.Size.Wed;
        this.DrawRectB.Size.Het : image.Size.Het;

        draw.ExecuteImage(image, this.DrawRectA, this.DrawRectB);
        return true;
    }
}