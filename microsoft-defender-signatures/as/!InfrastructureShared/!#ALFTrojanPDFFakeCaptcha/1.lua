-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:PDF/FakeCaptcha
-- Type: 13
-- MpAttributes: BM_PDF_FILE & SCPT:PDF/Fakecaptcha.PRF01

local l_0_0 = mp.getfilesize()
local l_0_1 = l_0_0 - 70
mp.readprotection(false)
local l_0_2 = tostring(mp.readfile(l_0_1, 20))
l_0_2 = string.lower(l_0_2)
local l_0_3 = l_0_2:match("/prev%s+(%d+)")
l_0_3 = l_0_3 and tonumber(l_0_3)
local l_0_4 = mp.readfile(l_0_3, 2048)
local l_0_5, l_0_6 = l_0_4:match("(%d)%s+(%d+)")
l_0_6 = tonumber(l_0_6 or 0)
if not l_0_6 and l_0_6 == 0 then
  return mp.CLEAN
end
if 100 < l_0_6 then
  l_0_6 = 100
end
local l_0_7 = 1
for l_0_8, l_0_9, l_0_10 in l_0_4:gmatch("(%d%d%d%d%d%d%d%d%d%d)%s+(%d+)%s+([nf])") do
  if l_0_10 == "n" then
    l_0_8 = l_0_8:gsub("^0+", "")
    local l_0_11 = mp.readfile(l_0_8, 30)
    l_0_11 = string.lower(l_0_11)
    if string.find(l_0_11, "/type/annot", 1, true) ~= nil then
      local l_0_12 = mp.readfile(l_0_8, 1200)
      l_0_12 = string.lower(l_0_12)
      if string.find(l_0_12, [[
/a<</s/uri
/uri(http]], 1, true) ~= nil and string.find(l_0_12, [[
/type/action>>
/subtype/link>>]], 1, true) ~= nil then
        if string.find(l_0_12, "http%a%://%w+%.zuwufag%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.godoxevez%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.tugoduzak%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.nurepikis%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.gonujovux%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.maxudijuz%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.pofezaf%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.dutabuz%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.bebopim%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.vimemug%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.lovali%.co%.za/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.riwitamo%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.muvemisavo%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.yftejum%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.pifazoveju%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.bovetewa%.com/", 1, false) ~= nil or string.find(l_0_12, "http%a%://%w+%.jufewine%.com/", 1, false) ~= nil then
          mp.set_mpattribute("LUA:PDF/FakeCaptcha.AA")
          return mp.INFECTED
        end
        return mp.INFECTED
      end
    end
  end
  l_0_7 = l_0_7 + 1
  if l_0_6 < l_0_7 then
    break
  end
end
return mp.CLEAN
