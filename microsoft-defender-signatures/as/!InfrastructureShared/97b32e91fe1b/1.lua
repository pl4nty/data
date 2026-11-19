-- Threat: !InfrastructureShared
-- Name: 97b32e91fe1b
-- Type: 21

local l_0_0
local l_0_1 = string.lower(bm.get_imagepath())
local l_0_2
if l_0_1 ~= nil and string.len(l_0_1) > 3 then
  l_0_2 = string.match(l_0_1, "(.-)[^\\]-[^\\%.]+$")
end
if this_sigattrlog[1].matched then
  l_0_0 = this_sigattrlog[1].utf8p2
elseif this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if l_0_0 ~= nil and string.len(l_0_0) > 3 then
  for l_0_3 in string.gmatch(l_0_0, "%S+") do
    if l_0_3 ~= nil and string.len(l_0_3) >= 1 and string.sub(l_0_3, 0, 1) ~= "/" then
      if sysio.IsFileExists(l_0_3) then
        bm.add_related_file(l_0_3)
      elseif l_0_2 ~= nil then
        local l_0_4 = l_0_2 .. l_0_3
        if sysio.IsFileExists(l_0_4) then
          bm.add_related_file(l_0_3)
        end
      end
    end
  end
end
local l_0_5
if this_sigattrlog[3].matched then
  l_0_5 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched then
  l_0_5 = this_sigattrlog[4].utf8p2
end
if l_0_5 ~= nil and string.len(l_0_5) > 3 then
  for l_0_6 in string.gmatch(l_0_5, "%S+") do
    if l_0_6 ~= nil and string.len(l_0_6) >= 1 and string.sub(l_0_6, 0, 1) ~= "/" then
      if sysio.IsFileExists(l_0_6) then
        bm.add_related_file(l_0_6)
      elseif l_0_2 ~= nil then
        local l_0_7 = l_0_2 .. l_0_6
        if sysio.IsFileExists(l_0_7) then
          bm.add_related_file(l_0_6)
        end
      end
    end
  end
end
return mp.INFECTED
