-- Threat: !InfrastructureShared
-- Name: 2b4b354f4e168
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
for l_0_2, l_0_3 in ipairs(l_0_0) do
  if l_0_3.image_path ~= nil and string.find(string.lower(l_0_3.image_path), "jobagent.host.exe", -17, true) then
    return mp.CLEAN
  end
end
local l_0_4
if this_sigattrlog[5].matched then
  l_0_4 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched then
  l_0_4 = string.lower(this_sigattrlog[6].utf8p2)
elseif this_sigattrlog[7].matched then
  l_0_4 = string.lower(this_sigattrlog[7].utf8p2)
elseif this_sigattrlog[8].matched then
  l_0_4 = string.lower(this_sigattrlog[8].utf8p2)
end
if not string.find(l_0_4, "\\inetpub\\wwwroot\\", 1, true) and not string.match(l_0_4, "\\microsoft\\exchange server\\v%d%d\\") and not string.match(l_0_4, "\\microsoft shared\\web server extensions\\%d%d\\") then
  return mp.CLEAN
end
local l_0_5
if this_sigattrlog[9].matched then
  l_0_5 = string.lower(this_sigattrlog[9].utf8p1)
elseif this_sigattrlog[10].matched then
  l_0_5 = string.lower(this_sigattrlog[10].utf8p1)
elseif this_sigattrlog[11].matched then
  l_0_5 = string.lower(this_sigattrlog[11].utf8p1)
elseif this_sigattrlog[12].matched then
  l_0_5 = string.lower(this_sigattrlog[12].utf8p1)
end
if l_0_5 ~= nil then
  local l_0_6 = string.sub(l_0_5, -4)
  local l_0_7 = "|.asp|aspx|ashx|"
  if string.find(l_0_7, l_0_6, 1, true) then
    if sysio.IsFileExists(l_0_5) then
      bm.add_related_file(l_0_5)
    end
    return mp.INFECTED
  end
end
return mp.CLEAN
