-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\EyeStye\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = function(l_1_0)
  -- function num : 0_0
  if l_1_0 then
    (MpDetection.ScanResource)("specialfolder://norecursive:file:" .. l_1_0)
  end
end

local l_0_1 = function(l_2_0, l_2_1, l_2_2)
  -- function num : 0_1
  local l_2_3, l_2_15 = nil
  for l_2_7,l_2_8 in ipairs(l_2_1) do
    local l_2_4 = nil
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R8 in 'UnsetPending'

    if (sysio.FindFiles)(l_2_0, R8_PC7, l_2_2) then
      for l_2_13,l_2_14 in pairs((sysio.FindFiles)(l_2_0, R8_PC7, l_2_2)) do
        local l_2_10 = nil
        -- DECOMPILER ERROR at PC16: Confused about usage of register: R14 in 'UnsetPending'

        l_2_4 = R14_PC16
      end
    end
  end
  return l_2_4
end

local l_0_2 = (MpDetection.GetCurrentThreat)()
if l_0_2 and l_0_2.Name then
  if (string.match)(l_0_2.Name, "Trojan:Win32/EyeStye%.gen!E") then
    (MpDetection.ScanResource)("file://%windir%\\system32\\wmimgr32.dll")
    ;
    (MpDetection.ScanResource)("file://%windir%\\system32\\wmimgr32.dl_")
    local l_0_3 = l_0_1
    local l_0_4 = "C:\\"
    local l_0_5 = {}
    -- DECOMPILER ERROR at PC32: No list found for R5 , SetList fails

    -- DECOMPILER ERROR at PC33: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC38: Overwrote pending register: R4 in 'AssignReg'

    if l_0_3 then
      l_0_4(l_0_5)
      -- DECOMPILER ERROR at PC41: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC42: Overwrote pending register: R5 in 'AssignReg'

      l_0_4(l_0_5)
      -- DECOMPILER ERROR at PC44: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC45: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC46: Overwrote pending register: R5 in 'AssignReg'

      l_0_4(l_0_5)
    else
      -- DECOMPILER ERROR at PC49: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC50: Overwrote pending register: R5 in 'AssignReg'

      local l_0_6 = {}
      -- DECOMPILER ERROR at PC52: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC53: No list found for R6 , SetList fails

      -- DECOMPILER ERROR at PC54: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC56: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC59: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC60: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC62: Overwrote pending register: R5 in 'AssignReg'

      -- DECOMPILER ERROR at PC63: Overwrote pending register: R5 in 'AssignReg'

      if l_0_3 then
        l_0_5(l_0_6)
        -- DECOMPILER ERROR at PC66: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC67: Overwrote pending register: R6 in 'AssignReg'

        l_0_5(l_0_6)
        -- DECOMPILER ERROR at PC69: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC70: Overwrote pending register: R5 in 'AssignReg'

        -- DECOMPILER ERROR at PC71: Overwrote pending register: R6 in 'AssignReg'

        l_0_5(l_0_6)
      end
    end
  else
    do
      -- DECOMPILER ERROR at PC74: Overwrote pending register: R3 in 'AssignReg'

      -- DECOMPILER ERROR at PC76: Overwrote pending register: R4 in 'AssignReg'

      -- DECOMPILER ERROR at PC77: Overwrote pending register: R5 in 'AssignReg'

      if not (l_0_3.match)(l_0_4, l_0_5) and not (string.match)(l_0_2.Name, "Trojan:Win32/EyeStye.*!cfg") and l_0_2.Resources then
        for l_0_10,l_0_11 in pairs(l_0_2.Resources) do
          -- DECOMPILER ERROR at PC95: Overwrote pending register: R8 in 'AssignReg'

          -- DECOMPILER ERROR at PC99: Overwrote pending register: R9 in 'AssignReg'

          if "winsrcv.bin" == "file" and type("wins.bin") == "string" and (string.match)(l_0_11.Path, "%.exe") then
            local l_0_12 = Infrastructure_SplitThreatPath(l_0_11.Path)
            l_0_0(l_0_12)
          end
        end
      end
    end
  end
end

