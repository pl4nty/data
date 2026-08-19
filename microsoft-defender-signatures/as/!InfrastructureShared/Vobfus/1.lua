-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Vobfus\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0, l_1_1)
  -- function num : 0_0
  if l_1_1 and l_1_1 ~= "" then
    (table.insert)(l_1_0, l_1_1)
  end
end

local l_0_2 = function(l_2_0)
  -- function num : 0_1 , upvalues : l_0_0
  local l_2_1 = "HKLM\\SYSTEM\\CurrentControlSet\\Services\\lanmanserver\\Shares"
  local l_2_2 = (sysio.RegOpenKey)(l_2_1)
  if not l_2_2 then
    return 
  end
  local l_2_3 = (sysio.RegEnumValues)(l_2_2)
  if not l_2_3 then
    return 
  end
  for l_2_7,l_2_8 in pairs(l_2_3) do
    if l_2_8 and l_2_8 ~= "" then
      l_0_0(l_2_0, "\\\\localhost\\" .. l_2_8)
    end
  end
end

local l_0_3 = function(l_3_0)
  -- function num : 0_2
  for l_3_4,l_3_5 in ipairs(l_3_0) do
    local l_3_6 = (sysio.FindFiles)(l_3_5, "*.lnk", 0)
    if l_3_6 then
      for l_3_10,l_3_11 in pairs(l_3_6) do
        if l_3_11 then
          (MpDetection.ScanResource)("file://" .. l_3_11)
        end
      end
    end
  end
  -- DECOMPILER ERROR at PC28: Confused about usage of register R1 for local variables in 'ReleaseLocals'

end

do
  local l_0_4, l_0_5, l_0_6, l_0_7, l_0_8 = {}, Infrastructure_GetAvailableDrives()
  if not R8_PC7 then
    return 
  end
  for l_0_12,l_0_13 in ipairs(l_0_5) do
    local l_0_9 = nil
    -- DECOMPILER ERROR at PC16: Confused about usage of register: R13 in 'UnsetPending'

    l_0_0(l_0_4, R13_PC16)
  end
  l_0_2(l_0_4)
  l_0_3(l_0_4)
  -- DECOMPILER ERROR at PC26: freeLocal<0 in 'ReleaseLocals'

end

