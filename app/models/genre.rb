class Genre < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '風景' },
    { id: 3, name: '建物' },
    { id: 4, name: '動物' },
  ]
end