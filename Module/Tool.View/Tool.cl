class Tool : View
{
    field prusate DrawImage PartTableImage { get { return data; } set { data : value; } }

    maide prusate Bool Load()
    {
        this.PartTableImage : this.DrawInfra.ImageCreateStorage("Tool.View-0.00.00.data/Data/PartTable.png");

        inf (this.PartTableImage = null)
        {
            return false;
        }
        return true;
    }
}