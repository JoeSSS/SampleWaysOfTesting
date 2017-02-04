require 'pry'
def create_page_by_name(page_name)
  create_page(Object.const_get(page_name))
end

def create_page(clz)
  clz.new(self)
end

def get_path(item_name)
  full_item_name = item_name
  splitted_item_name = full_item_name.split(/\s|\./)
  page_name, control_name = splitted_item_name
  p = create_page_by_name(page_name)
  p.send(control_name)
end
