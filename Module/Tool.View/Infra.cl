class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawInfra : share DrawInfra;
        this.DrawBrushKindList : share DrawBrushKindList;
        return true;
    }

    field prusate DrawImage ImageTableHeadLite { get { return data; } set { data : value; } }
    field prusate DrawImage ImageTableHeadRite { get { return data; } set { data : value; } }
    field prusate DrawImage ImageTableHeadMid { get { return data; } set { data : value; } }
    field prusate DrawBrush BrushTableHeadMid { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate DrawBrushKindList DrawBrushKindList { get { return data; } set { data : value; } }

    maide prusate Bool Load()
    {
        this.ImageTableHeadLite : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/TableHeadLite.png");
        inf (this.ImageTableHeadLite = null)
        {
            return false;
        }
        this.ImageTableHeadRite : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/TableHeadRite.png");
        inf (this.ImageTableHeadRite = null)
        {
            return false;
        }
        this.ImageTableHeadMid : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/TableHeadMid.png");
        inf (this.ImageTableHeadMid = null)
        {
            return false;
        }

        this.BrushTableHeadMid : new DrawBrush;
        this.BrushTableHeadMid.Kind : this.DrawBrushKindList.Image;
        this.BrushTableHeadMid.Image : this.imageTableHeadMid;
        this.BrushTableHeadMid.Init();

        return true;
    }
}