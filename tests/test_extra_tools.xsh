from xonsh.extra_tools import indir, run, check_call


def test_indir(source_path):
    assert ![pwd].output.strip() != source_path
    with indir(source_path):
        assert ![pwd].output.strip() == source_path
    assert ![pwd].output.strip() != source_path


def test_run(tmpdir):
    with indir(tmpdir):
        run(['touch', 'hello.txt'])
        assert 'hello.txt' in g`*.txt`
        rm hello.txt
        mkdir tst_dir
        run(['touch', 'hello.txt'], cwd='tst_dir')
        assert 'hello.txt' in g`tst_dir/*.txt`


def test_check_call(tmpdir):
    with indir(tmpdir):
        check_call(['touch', 'hello.txt'])
        assert 'hello.txt' in g`*.txt`
        rm hello.txt
        mkdir tst_dir
        check_call(['touch', 'hello.txt'], cwd='tst_dir')
        assert 'hello.txt' in g`tst_dir/*.txt`
