include_recipe 'nodejs'

execute 'install hg' do
    command 'sudo apt-get install mercurial -y'
end

execute 'install gvim' do
    command 'sudo apt-get install vim-gnome -y'
end

execute 'install coffeescript' do
    command 'sudo npm -g install coffee-script'
end
