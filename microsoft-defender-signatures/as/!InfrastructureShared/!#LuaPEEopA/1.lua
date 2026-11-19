-- Threat: !InfrastructureShared
-- Name: !#Lua:PEEop.A
-- Type: 13
-- MpAttributes: BM_MZ_FILE & !Exclusion:EOP:MSIL

local l_0_0 = mp.getfilename()
if l_0_0 ~= nil then
  l_0_0 = string.lower(l_0_0)
  local l_0_1 = string.sub(l_0_0, -4)
  if l_0_0:match("%->.+/") or l_0_0:match("%->.+\\") or l_0_0:match("%->.+%.cab%->") then
    return mp.CLEAN
  end
  if l_0_1 == ".exe" or l_0_1 == ".scr" or l_0_1 == ".com" then
    local l_0_2 = {
      "ALF:Trojan:Win32/",
      "SLF:Trojan:Win32/",
      "Lowfi:HSTR:Win32/",
      "ALF:TrojanSpy:Win32/",
      "ALF:HSTR:Win32/"
    }
    local l_0_3 = 0
    for l_0_4, l_0_5 in pairs(l_0_2) do
      local l_0_6 = mp.enum_mpattributesubstring(l_0_5)
      if l_0_6 ~= nil and type(l_0_6) == "table" then
        l_0_3 = l_0_3 + #l_0_6
        if 2 <= l_0_3 then
          return mp.INFECTED
        end
      end
    end
    local l_0_7 = {
      "TEL:Win32/",
      "TELPER:Trojan:Win32/",
      "HSTR:VirTool:Win32/",
      "HSTR:Backdoor:Win32/",
      "HSTR:TrojanDropper:Win32/",
      "HSTR:TrojanDownloader:Win32/",
      "TEL:Trojan:Win32/",
      "HSTR:VirTool:Win32/Obfuscator",
      "LoD:VirTool:Win32/Obfuscator",
      "AGGR:MSIL:GenPossibleCustomObfuscator.A"
    }
    local l_0_8 = 0
    for l_0_9, l_0_10 in pairs(l_0_7) do
      local l_0_11 = mp.enum_mpattributesubstring(l_0_10)
      if l_0_11 ~= nil and type(l_0_11) == "table" then
        l_0_8 = #l_0_11 + l_0_8
        if l_0_3 == 0 and 5 <= l_0_8 then
          return mp.INFECTED
        elseif l_0_3 == 1 and 2 <= l_0_8 then
          return mp.INFECTED
        end
      end
    end
    local l_0_12 = {
      "HSTR:Win32/",
      "HSTR:Trojan:Win32/"
    }
    local l_0_13 = 0
    for l_0_14, l_0_15 in pairs(l_0_12) do
      local l_0_16 = mp.enum_mpattributesubstring(l_0_15)
      if l_0_16 ~= nil and type(l_0_16) == "table" then
        l_0_13 = l_0_13 + #l_0_16
        if l_0_3 == 1 and 2 <= l_0_8 and 4 <= l_0_13 then
          return mp.INFECTED
        elseif 2 <= l_0_8 and 6 <= l_0_13 then
          return mp.INFECTED
        elseif 4 <= l_0_8 + l_0_13 then
          mp.set_mpattribute("Lua:PEEop.B")
        end
      end
    end
  end
end
return mp.CLEAN
