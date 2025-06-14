class Infra : Any
{
    field prusate DrawImage ImagePartTable { get { return data; } set { data : value; } }
    field prusate DrawImage IconPackageList { get { return data; } set { data : value; } }

    maide prusate Bool Load()
    {
        this.ImagePartTable : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/PartTable.png");
        inf (this.ImagePartTable = null)
        {
            return false;
        }

        this.IconPackageList : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/Icon/PackageList.png");
        inf (this.IconPackageList = null)
        {
            return false;
        }

        return true;
    }
}