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
        var String path;
        path : "Tool.Icon-0.00.00.data/Icon/data.dat";

        var Storage storage;
        storage : new Storage;
        storage.Init();

        var StorageMode mode;
        mode : new StorageMode;
        mode.Init();
        mode.Read : true;

        storage.Path : path;
        storage.Mode : mode;

        storage.Open();

        inf (~(storage.Status = this.StorageStatusList.NoError))
        {
            return false;
        }

        var Stream stream;
        stream : storage.Stream;

        var DrawImageRead imageRead;
        imageRead : new DrawImageRead;
        imageRead.Init();
        imageRead.Stream : stream;

        var Bool b;
        b : this.LoadIcon(imageRead);

        imageRead.Final();

        storage.Close();
        storage.Final();

        return b;
    }

    maide precate Bool LoadIcon(var DrawImageRead imageRead)
    {
#Load#
        return true;
    }

    maide precate DrawImage ImageRead(var DrawImageRead imageRead)
    {
        var DrawImage k;

        var DrawImage ka;
        ka : new DrawImage;
        ka.Init();

        imageRead.Image : ka;

        var Bool b;
        b : imageRead.Execute();
        inf (b)
        {
            k : ka;
        }
        inf (~b)
        {
            ka.Final();
        }

        return k;
    }
}