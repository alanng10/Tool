class Infra : Any
{
    maide prusate Bool Init()
    {
        base.Init();
        this.DrawInfra : share DrawInfra;
        this.StorageStatusList : share StorageStatusList;
        this.IconList : share IconList;
        return true;
    }

    field precate DrawInfra DrawInfra { get { return data; } set { data : value; } }
    field precate StorageStatusList StorageStatusList { get { return data; } set { data : value; } }
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
        this.IconList.PackageList.Image : this.ImageRead(imageRead);
        inf (this.IconList.PackageList.Image = null)
        {
            return false;
        }
        this.IconList.ToolNew.Image : this.ImageRead(imageRead);
        inf (this.IconList.ToolNew.Image = null)
        {
            return false;
        }
        this.IconList.Save.Image : this.ImageRead(imageRead);
        inf (this.IconList.Save.Image = null)
        {
            return false;
        }
        this.IconList.SaveAll.Image : this.ImageRead(imageRead);
        inf (this.IconList.SaveAll.Image = null)
        {
            return false;
        }
        this.IconList.Undo.Image : this.ImageRead(imageRead);
        inf (this.IconList.Undo.Image = null)
        {
            return false;
        }
        this.IconList.Redo.Image : this.ImageRead(imageRead);
        inf (this.IconList.Redo.Image = null)
        {
            return false;
        }
        this.IconList.Execute.Image : this.ImageRead(imageRead);
        inf (this.IconList.Execute.Image = null)
        {
            return false;
        }
        this.IconList.PackageNew.Image : this.ImageRead(imageRead);
        inf (this.IconList.PackageNew.Image = null)
        {
            return false;
        }
        this.IconList.ClassNew.Image : this.ImageRead(imageRead);
        inf (this.IconList.ClassNew.Image = null)
        {
            return false;
        }
        this.IconList.OpenClass.Image : this.ImageRead(imageRead);
        inf (this.IconList.OpenClass.Image = null)
        {
            return false;
        }
        this.IconList.Find.Image : this.ImageRead(imageRead);
        inf (this.IconList.Find.Image = null)
        {
            return false;
        }
        this.IconList.LabelNext.Image : this.ImageRead(imageRead);
        inf (this.IconList.LabelNext.Image = null)
        {
            return false;
        }
        this.IconList.LabelPrev.Image : this.ImageRead(imageRead);
        inf (this.IconList.LabelPrev.Image = null)
        {
            return false;
        }
        this.IconList.Back.Image : this.ImageRead(imageRead);
        inf (this.IconList.Back.Image = null)
        {
            return false;
        }
        this.IconList.Front.Image : this.ImageRead(imageRead);
        inf (this.IconList.Front.Image = null)
        {
            return false;
        }

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