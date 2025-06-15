namespace Z.Tool.Tool.IconData;

class Gen : ToolBase
{
    public override bool Init()
    {
        base.Init();
        this.StorageStatusList = StorageStatusList.This;
        return true;
    }

    protected virtual StorageStatusList StorageStatusList { get; set; }

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

        Storage storage;
        storage = new Storage();
        storage.Init();

        StorageMode mode;
        mode = new StorageMode();
        mode.Init();
        mode.Write = true;

        storage.Mode = mode;
        storage.Path = this.S("../../Module/Tool.Icon/Data/Icon/data.dat");

        storage.Open();

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

            Data data;
            data = this.StorageInfra.DataRead(filePath);

            if (data == null)
            {
                return 100;
            }

            if (!(storage.Status == this.StorageStatusList.NoError))
            {
                return 200;
            }

            Range range;
            range = new Range();
            range.Init();
            range.Index = 0;
            range.Count = data.Count;

            storage.Stream.Write(data, range);

            if (!(storage.Status == this.StorageStatusList.NoError))
            {
                return 210;
            }

            i = i + 1;
        }

        storage.Close();
        storage.Final();
        return 0;
    }
}