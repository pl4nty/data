-- Threat: !InfrastructureShared
-- Name: !#Lua:HeaderJSArrayDeobfus.A
-- Type: 13
-- MpAttributes: AGGR:Trojan:Win32/JsArrayObfus & RPF:TopLevelFile

function escape_word(l_1_0)
  return l_1_0:gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]", function(l_2_0)
    return "%" .. l_2_0
  end)
end

local l_0_0 = tostring(headerpage)
l_0_0 = l_0_0:gsub("%%", ">|")
local l_0_1 = 0
if l_0_0 then
  for l_0_2, l_0_3 in l_0_0:gmatch("+?(%[%'.-%'%])(%[%d%])+?") do
    local l_0_4
    if 95 < l_0_1 then
      break
    elseif l_0_3 == "[0]" then
      l_0_4 = l_0_2:match("%+?%[('.-'),'.-%]")
    elseif l_0_3 == "[1]" then
      l_0_4 = l_0_2:match("%+?%[%'.-',('.-').-%]")
    elseif l_0_3 == "[2]" then
      l_0_4 = l_0_2:match("%+?%[%'.-','.-',('.-').-%]")
    elseif l_0_3 == "[3]" then
      l_0_4 = l_0_2:match("%+?%[%'.-','.-','.-',('.-').-%]")
    elseif l_0_3 == "[4]" then
      l_0_4 = l_0_2:match("%+?%[%'.-','.-','.-','.-',('.-').-%]")
    end
    if l_0_4 then
      l_0_0, _ = string.gsub(l_0_0, escape_word(l_0_2 .. l_0_3), l_0_4)
      l_0_1 = l_0_1 + 1
    end
  end
end
if 5 <= l_0_1 then
  l_0_0, _ = string.gsub(l_0_0, "%'%+%'", "")
  l_0_0, _ = string.gsub(l_0_0, "\\x(%x%x)", function(l_3_0)
    return string.format("%c", tonumber(l_3_0, 16))
  end)
  l_0_0, _ = l_0_0:gsub(">|", "%%")
  l_0_0, _ = string.gsub(l_0_0, "%%(%x%x)", function(l_4_0)
    return string.format("%c", tonumber(l_4_0, 16))
  end)
  mp.vfo_add_buffer(l_0_0, "[hdr-jsarr-deobfus]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
  return mp.INFECTED
end
return mp.CLEAN
