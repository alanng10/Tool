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

        this.HeadNameAfterSpace : 0;
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
    field precate Int HeadNameAfterSpace { get { return data; } set { data : value; } }

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
        this.Child : cast Part(this.Part.Get(this.Index));

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
        this.ExecuteDrawHead(draw);
        this.ExecuteDrawBord(draw);
        return true;
    }

    maide precate Bool ExecuteDrawBord(var Draw draw)
    {
        this.DrawRectA.Pos.Col : this.Pos.Col + 1;
        this.DrawRectA.Pos.Row : this.Pos.Row + this.ToolViewInfra.ImageTableHeadLite.Size.Hegth;
        this.DrawRectA.Size.Width : 1200;
        this.DrawRectA.Size.Hegth : 2;

        draw.Fill : this.ToolViewInfra.BrushTableBord;

        draw.ExecuteRect(this.DrawRectA);

        draw.Fill : null;
        return true;
    }

    maide precate Bool ExecuteDrawHead(var Draw draw)
    {
        var Int iconPos;
        iconPos : 4;

        var DrawImage image;

        var Part part;

        var Int nameCount;

        var Int headWidth;

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

            headWidth : this.HeadWidth(part.Icon, nameCount, iconPos);

            this.ExecuteDrawHeadMid(draw, this.ToolViewInfra.BrushTableHeadBeforeMid, col, headWidth + this.HeadNameAfterSpace + 2, image.Size.Width);

            this.ExecuteDrawHeadIcon(draw, part, col, iconPos, iconPos);

            this.ExecuteDrawHeadName(draw, part, this.DrawInfra.SlashBlack, col, iconPos);

            col : col + headWidth + this.HeadNameAfterSpace + 2;

            i : i + 1;
        }

        inf (0 < i)
        {
            this.ExecuteDrawHeadImage(draw, this.ToolViewInfra.ImageTableHeadBeforeRite, col, 0);

            col : col + this.ToolViewInfra.ImageTableHeadBeforeRite.Size.Width;
        }

        part : cast Part(this.Part.Get(this.Index));

        nameCount : this.StringComp.Count(part.Name);

        image : this.ToolViewInfra.ImageTableHeadLite;

        this.ExecuteDrawHeadImage(draw, image, col, 0);

        headWidth : this.HeadWidth(part.Icon, nameCount, iconPos);

        this.ExecuteDrawHeadMid(draw, this.ToolViewInfra.BrushTableHeadMid, col, headWidth, image.Size.Width);

        this.ExecuteDrawHeadImage(draw, this.ToolViewInfra.ImageTableHeadRite, col + headWidth, 0);

        this.ExecuteDrawHeadIcon(draw, part, col, iconPos, iconPos);

        this.ExecuteDrawHeadName(draw, part, this.DrawInfra.SlashWhite, col, iconPos);

        col : col + headWidth + this.ToolViewInfra.ImageTableHeadRite.Size.Width;

        i : this.Index + 1;

        while (i < this.Part.Count)
        {
            part : cast Part(this.Part.Get(i));

            nameCount : this.StringComp.Count(part.Name);

            headWidth : this.HeadWidth(part.Icon, nameCount, iconPos);

            var Int kaa;
            kaa : 0;
            inf (i = this.Index + 1)
            {
                kaa : 9;
            }

            this.ExecuteDrawHeadMid(draw, this.ToolViewInfra.BrushTableHeadBeforeMid, col, headWidth + this.HeadNameAfterSpace - kaa, 0);

            this.ExecuteDrawHeadImage(draw, this.ToolViewInfra.ImageTableHeadAfterRite, col + headWidth + this.HeadNameAfterSpace - kaa, 0);

            this.ExecuteDrawHeadIcon(draw, part, col - kaa, iconPos, iconPos);

            this.ExecuteDrawHeadName(draw, part, this.DrawInfra.SlashBlack, col - kaa, iconPos);

            col : col + headWidth + this.HeadNameAfterSpace + this.ToolViewInfra.ImageTableHeadAfterRite.Size.Width - kaa;

            i : i + 1;
        }

        return true;
    }

    maide precate Int HeadWidth(var Icon icon, var Int nameCount, var Int iconCol)
    {
        return iconCol + icon.Size.Count + 5 + nameCount * 8;
    }

    maide precate Bool ExecuteDrawHeadMid(var Draw draw, var DrawBrush brush, var Int col, var Int width, var Int beforeWidth)
    {
        var Int midWidth;
        midWidth : width;
        midWidth : midWidth - beforeWidth;

        draw.Fill : brush;

        draw.FillPos.Col : this.MathInt(this.Pos.Col);
        draw.FillPos.Row : this.MathInt(this.Pos.Row);
        draw.FillPosSet();

        this.DrawRectA.Pos.Col : this.Pos.Col + col + beforeWidth;
        this.DrawRectA.Pos.Row : this.Pos.Row;
        this.DrawRectA.Size.Width : midWidth;
        this.DrawRectA.Size.Hegth : brush.Image.Size.Hegth;

        draw.ExecuteRect(this.DrawRectA);

        draw.Fill : null;
        return true;
    }

    maide precate Bool ExecuteDrawHeadIcon(var Draw draw, var Part part, var Int col, var Int iconCol, var Int iconRow)
    {
        this.ExecuteDrawHeadImage(draw, part.Icon.Image, col + iconCol, iconRow);
        return true;
    }

    maide precate Bool ExecuteDrawHeadName(var Draw draw, var Part part, var DrawSlash slash, var Int col, var Int iconCol)
    {
        this.StringData.ValueString : part.Name;

        this.Text.Data : this.StringData;
        this.Text.Range.Index : 0;
        this.Text.Range.Count : this.StringComp.Count(part.Name);

        this.DrawRectA.Pos.Col : this.Pos.Col + col + iconCol + part.Icon.Size.Count + 3;
        this.DrawRectA.Pos.Row : this.Pos.Row + 5;
        this.DrawRectA.Size.Width : 8 * this.Text.Range.Count;
        this.DrawRectA.Size.Hegth : 15;

        draw.Font : this.Palete.FontMono;

        draw.Line : slash;

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
        this.DrawRectA.Size.Width : image.Size.Width;
        this.DrawRectA.Size.Hegth : image.Size.Hegth;

        this.DrawRectB.Pos.Col : 0;
        this.DrawRectB.Pos.Row : 0;
        this.DrawRectB.Size.Width : image.Size.Width;
        this.DrawRectB.Size.Hegth : image.Size.Hegth;

        draw.ExecuteImage(image, this.DrawRectA, this.DrawRectB);
        return true;
    }
}