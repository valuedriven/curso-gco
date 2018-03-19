job('conchayro') {
    scm {
        git('http://github.com/valuedriven/curso-gco')
    }
    steps {
        shell('echo Primeiro passo!')
    }
}
