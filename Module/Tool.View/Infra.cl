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
    field prusate DrawImage ImageTableHeadBeforeLite { get { return data; } set { data : value; } }
    field prusate DrawImage ImageTableHeadBeforeLite2 { get { return data; } set { data : value; } }
    field prusate DrawImage ImageTableHeadBeforeRite { get { return data; } set { data : value; } }
    field prusate DrawImage ImageTableHeadBeforeMid { get { return data; } set { data : value; } }
    field prusate DrawImage ImageTableHeadAfterRite { get { return data; } set { data : value; } }
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
        this.ImageTableHeadBeforeLite : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/TableHeadBeforeLite.png");
        inf (this.ImageTableHeadBeforeLite = null)
        {
            return false;
        }
        this.ImageTableHeadBeforeLite2 : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/TableHeadBeforeLite2.png");
        inf (this.ImageTableHeadBeforeLite2 = null)
        {
            return false;
        }
        this.ImageTableHeadBeforeRite : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/TableHeadBeforeRite.png");
        inf (this.ImageTableHeadBeforeRite = null)
        {
            return false;
        }
        this.ImageTableHeadBeforeMid : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/TableHeadBeforeMid.png");
        inf (this.ImageTableHeadBeforeMid = null)
        {
            return false;
        }
        this.ImageTableHeadAfterRite : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/TableHeadAfterRite.png");
        inf (this.ImageTableHeadAfterRite = null)
        {
            return false;
        }

        this.BrushTableHeadMid : new DrawBrush;
        this.BrushTableHeadMid.Kind : this.DrawBrushKindList.Image;
        this.BrushTableHeadMid.Image : this.ImageTableHeadMid;
        this.BrushTableHeadMid.Init();

        return true;
    }
}