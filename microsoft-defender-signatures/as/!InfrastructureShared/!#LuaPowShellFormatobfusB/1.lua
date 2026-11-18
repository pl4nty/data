-- Threat: !InfrastructureShared
-- Name: !#Lua:PowShellFormatobfus.B
-- Type: 24
-- MpAttributes: MpIsExhaustiveScriptScan & (MpIsPowerShellAMSIScan | Nscript:Type_ps)

local l_0_0 = mp.getfilename(mp.FILEPATH_QUERY_LOWERCASE)
if l_0_0:find("psdeobfus-stg1", 1, true) or l_0_0:find("deobfus", 1, true) then
  if l_0_0:find("psdeobfus-stg2", 1, true) then
    return mp.CLEAN
  end
  
  function escape_word(l_1_0)
    return l_1_0:gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]", function(l_2_0)
      return "%" .. l_2_0
    end)
  end
  
  local l_0_1 = mp.getfilesize()
  if 200000 < l_0_1 then
    return mp.CLEAN
  end
  mp.readprotection(false)
  local l_0_2 = mp.readfile(0, l_0_1)
  if l_0_2 == nil or l_0_2 == "" then
    return mp.CLEAN
  end
  local l_0_3 = 0
  for l_0_4, l_0_5 in string.gmatch(l_0_2, "(\"{[%d{}]+}\")-f([\"%'](.-)[\"%'])[%)]") do
    local l_0_6 = l_0_4 .. "-f" .. l_0_5
    local l_0_7 = {}
    for l_0_8 in string.gmatch(l_0_4, "%d+") do
      table.insert(l_0_7, tonumber(l_0_8) + 1)
    end
    local l_0_9 = {}
    for l_0_10 in string.gmatch(l_0_5, "[\"%'](.-)[\"%']") do
      table.insert(l_0_9, l_0_10)
    end
    if #l_0_9 == #l_0_7 then
      local l_0_11
      for l_0_12, l_0_13 in ipairs(l_0_7) do
        local l_0_14 = l_0_9[l_0_13]
        l_0_11, l_0_4 = pcall(string.gsub, l_0_4, "{" .. l_0_13 - 1 .. "}", l_0_14)
      end
      if l_0_11 then
        l_0_3 = l_0_3 + 1
        l_0_6 = escape_word(l_0_6)
        l_0_2 = string.gsub(l_0_2, l_0_6, l_0_4)
      end
    end
  end
  if 3 <= l_0_3 then
    mp.vfo_add_buffer(l_0_2, "[psdeobfus-stg2]", mp.ADD_VFO_TAKE_ACTION_ON_DAD)
    return mp.INFECTED
  end
end
return mp.CLEAN
