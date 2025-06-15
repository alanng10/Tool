class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawInfra : share DrawInfra;
        return true;
    }

    field prusate DrawImage ImagePartTable { get { return data; } set { data : value; } }
    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }

    maide prusate Bool Load()
    {
        this.ImagePartTable : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/PartTable.png");
        inf (this.ImagePartTable = null)
        {
            return false;
        }

        return true;
    }
}