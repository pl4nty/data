-- Threat: !InfrastructureShared
-- Name: !#Lua:PowShellFormat!obfus
-- Type: 13

function escape_word(l_1_0)
  return l_1_0:gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]", function(l_2_0)
    return "%" .. l_2_0
  end)
end

if mp.get_mpattribute("SCRIPT:PowShellFormat!obfus") or mp.get_mpattribute("SCRIPT:PowShellFormat!obfus2") or mp.get_mpattribute("SCRIPT:PowShellFormat!obfus3") then
  local l_0_0 = mp.getfilesize()
  if 131072 < l_0_0 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_1 = mp.readfile(0, l_0_0)
  l_0_1 = string.lower(l_0_1)
  l_0_1 = string.gsub(l_0_1, " ", "")
  if mp.get_mpattribute("SCRIPT:PowShellFormat!obfus2") then
    l_0_1 = string.gsub(l_0_1, "\\'", "'")
    l_0_1 = string.gsub(l_0_1, "`", "")
  end
  if mp.get_mpattribute("SCRIPT:PowShellFormat!obfus3") then
    l_0_1 = string.gsub(l_0_1, "%+chr%(34%)%+\"", "")
    l_0_1 = string.gsub(l_0_1, "`", "")
  end
  local l_0_2 = 0
  for l_0_3 in string.gmatch(l_0_1, "%(\"{%d+}{%d+}.-\"%-f'.-','.-[^,]'%)") do
    local l_0_4, l_0_5 = string.match(l_0_3, "%(\"({%d+}{%d+}.-)\"%-f('.-','.-[^,]')%)")
    if l_0_4 and l_0_5 then
      local l_0_6 = {}
      for l_0_7 in string.gmatch(l_0_4, "{(%d+)}") do
        table.insert(l_0_6, l_0_7)
      end
      local l_0_8 = {}
      for l_0_9 in string.gmatch(l_0_5, "'(.-)'") do
        table.insert(l_0_8, l_0_9)
      end
      if #l_0_6 == #l_0_8 then
        local l_0_10 = #l_0_6
        local l_0_11 = ""
        for l_0_12 = 1, l_0_10 do
          l_0_11 = l_0_11 .. l_0_8[l_0_6[l_0_12] + 1]
        end
        l_0_3 = escape_word(l_0_3)
        l_0_1 = string.gsub(l_0_1, l_0_3, l_0_11)
        l_0_2 = l_0_2 + 1
      end
    end
  end
  if 3 <= l_0_2 then
    l_0_1 = string.gsub(l_0_1, "`([%a%d])", "%1")
    l_0_1 = string.gsub(l_0_1, "\"%+\"", "")
    l_0_1 = string.gsub(l_0_1, "'%+'", "")
    l_0_1 = string.gsub(l_0_1, "%.\"(%w+)\"", "%.%1")
    l_0_1 = string.gsub(l_0_1, "::\"(%w+)\"", "::%1")
    mp.vfo_add_buffer(l_0_1, "[deobfus]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.INFECTED
  end
end
return mp.CLEAN
