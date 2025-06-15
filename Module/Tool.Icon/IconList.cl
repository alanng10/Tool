class IconList : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawInfra : share DrawInfra;
        this.IconSizeList : share IconSizeList;
        return true;
    }

    field prusate Icon IconPackageList { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate IconSizeList IconSizeList { get { return data; } set { data : value; } }

    maide prusate Bool Load()
    {
        this.IconPackageList : this.IconCreateStorage("Tool.Icon-0.00.00.data/Data/Icon/PackageList.png");
        inf (this.IconPackageList = null)
        {
            return false;
        }

        return true;
    }

    maide prusate Icon IconCreateStorage(var String path)
    {
        var DrawImage image;
        image : this.DrawInfra.ImageCreateStorage(path);

        inf (image = null)
        {
            return null;
        }

        var Icon a;
        a : new Icon;
        a.Init();
        a.Image : image;
        a.Size : this.IconSizeList.Small;
        return a;
    }
}