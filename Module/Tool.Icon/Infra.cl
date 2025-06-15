class IconList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawInfra : share DrawInfra;
        this.IconList : share IconList;
        return true;
    }

    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate IconList IconList { get { return data; } set { data : value; } }

    maide prusate Bool Load()
    {
        this.IconList.PackageList.Image : this.DrawInfra.ImageCreateStorage("Tool.Icon-0.00.00.data/Data/Icon/PackageList.png");
        inf (this.IconList.PackageList.Image = null)
        {
            return false;
        }

        return true;
    }
}