namespace Z.Tool.Tool.IconList;

public class Gen : SourceGen
{
    public override bool Init()
    {
        base.Init();
        this.Module = this.S("Tool.Icon");
        this.ClassName = this.S("IconList");
        this.BaseClassName = this.S("Any");
        this.AnyClassName = this.S("Any");
        this.ItemClassName = this.S("Icon");
        this.ArrayClassName = this.S("Array");
        this.Export = true;
        this.ItemListFileName = this.S("ToolData/Tool/ItemListIcon.txt");
        this.AddMethodFileName = this.S("ToolData/Tool/AddMaideIcon.txt");
        this.InitMethodFileName = this.S("ToolData/Tool/InitMaideIcon.txt");
        this.ArrayCompListFileName = this.S("ToolData/Tool/ArrayCompListIcon.txt");
        this.OutputFilePath = this.S("../../Module/Tool.Icon/IconList.cl");
        return true;
    }

    public override long Execute()
    {
        long k;
        k = base.Execute();

        if (!(k == 0))
        {
            return k;
        }

        this.ExecuteInfra();

        return 0;
    }

    protected virtual bool ExecuteInfra()
    {
        String infraLoadPath;
        infraLoadPath = this.S("ToolData/Tool/InfraLoad.txt");

        String infraLoadText;
        infraLoadText = this.StorageTextRead(infraLoadPath);

        this.AddClear();

        Iter iter;
        iter = this.ItemTable.IterCreate();
        this.ItemTable.IterSet(iter);
        while (iter.Next())
        {
            String index;
            index = iter.Index as String;

            Text k;
            k = this.TextCreate(infraLoadText);
            k = this.Place(k, "#Name#", index);

            String ka;
            ka = this.StringCreate(k);

            this.Add(ka);
        }

        String kd;
        kd = this.AddResult();

        String infraPath;
        infraPath = this.S("ToolData/Tool/Infra.cl");

        String infraText;
        infraText = this.StorageTextRead(infraPath);

        Text kaa;
        kaa = this.TextCreate(infraText);
        kaa = this.Place(kaa, "#Load#", kd);

        String a;
        a = this.StringCreate(kaa);

        this.StorageTextWrite(this.S("../../Module/Tool.Icon/Infra.cl"), a);

        return true;
    }

    protected override TableEntry GetItemEntry(String line)
    {
        Text kka;
        kka = this.TextCreate(this.S(" "));

        Text k;
        k = this.TextCreate(line);

        Array array;
        array = this.TextLimit(k, kka);

        Text ka;
        Text kb;
        ka = array.GetAt(0) as Text;
        kb = array.GetAt(1) as Text;

        String index;
        index = this.StringCreate(ka);

        String size;
        size = this.StringCreate(kb);

        Value value;
        value = new Value();
        value.Init();
        value.Size = size;

        TableEntry entry;
        entry = new TableEntry();
        entry.Init();
        entry.Index = index;
        entry.Value = value;
        return entry;
    }

    protected override bool AddInitFieldAddItem(String index, object value)
    {
        Value a;
        a = value as Value;

        String ka;
        ka = this.TextInfra.Zero;

        if (this.TextSame(this.TA(a.Size), this.TB(this.S("s"))))
        {
            ka = this.S("Small");
        }

        this.AddS("AddItem")
            .AddS("(")
            .AddS("this.IconSizeList.").Add(ka)
            .AddS(")");
        return true;
    }
}