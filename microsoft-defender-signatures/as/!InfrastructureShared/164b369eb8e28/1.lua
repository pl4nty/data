-- Threat: !InfrastructureShared
-- Name: 164b369eb8e28
-- Type: 21

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
end
if l_0_0 ~= nil then
  local l_0_1 = string.sub(l_0_0, -4)
  local l_0_2 = "|.asp|aspx|ashx|asmx|"
  if string.find(l_0_2, l_0_1, 1, true) then
    local l_0_3 = string.lower(bm.get_imagepath())
    if string.match(l_0_3, "\\microsoft\\exchange server\\v%d%d\\") ~= nil or string.match(l_0_3, "\\microsoft shared\\web server extensions\\%d%d\\") ~= nil then
      return mp.CLEAN
    end
    local l_0_4, l_0_5 = bm.get_process_relationships()
    for l_0_6, l_0_7 in ipairs(l_0_4) do
      if l_0_7.image_path ~= nil and (string.match(string.lower(l_0_7.image_path), "\\microsoft\\exchange server\\v%d%d\\") ~= nil or string.match(string.lower(l_0_7.image_path), "\\microsoft shared\\web server extensions\\%d%d\\") ~= nil) then
        return mp.CLEAN
      end
    end
    if sysio.IsFileExists(l_0_0) then
      bm.add_related_file(l_0_0)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
