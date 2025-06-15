namespace Z.Tool.Tool.IconData;

class Gen : ToolBase
{
    public virtual long Execute()
    {
        String iconListPath;
        iconListPath = this.S("ToolData/Tool/ItemListIcon.txt");

        String iconListText;
        iconListText = this.StorageTextRead(iconListPath);

        Array lineList;
        lineList = this.StringLine(this.TA(iconListText));

        Text kka;
        kka = this.TextCreate(this.S(" "));

        long count;
        count = lineList.Count;
        long i;
        i = 0;
        while (i < count)
        {
            String line;
            line = lineList.GetAt(i) as String;

            Text k;
            k = this.TextCreate(line);

            Array array;
            array = this.TextLimit(k, kka);

            Text ka;
            Text kb;
            ka = array.GetAt(0) as Text;
            kb = array.GetAt(1) as Text;

            String name;
            name = this.StringCreate(ka);

            String filePath;
            filePath = this.AddClear().AddS("../../Icon/").Add(name).AddS(".png").AddResult();

            this.StorageInfra.DataRead(filePath);

            i = i + 1;
        }
        return 0;
    }
}