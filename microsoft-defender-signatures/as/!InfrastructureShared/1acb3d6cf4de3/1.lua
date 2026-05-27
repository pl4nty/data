-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1acb3d6cf4de3\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC16: Overwrote pending register: R0 in 'AssignReg'

if (this_sigattrlog[1]).matched and (this_sigattrlog[1]).utf8p2 ~= nil then
  local l_0_0, l_0_1, l_0_3, l_0_4, l_0_6, l_0_7 = nil, nil
  l_0_1 = "vbc.exe"
  local l_0_2, l_0_5, l_0_8 = nil
else
end
do
  if not (this_sigattrlog[2]).matched or (this_sigattrlog[2]).utf8p2 == nil or (string.lower)((this_sigattrlog[2]).utf8p2) == nil then
    return mp.CLEAN
  end
  local l_0_9 = nil
  -- DECOMPILER ERROR at PC52: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC54: Confused about usage of register: R1 in 'UnsetPending'

  -- DECOMPILER ERROR at PC63: Overwrote pending register: R2 in 'AssignReg'

  if ("csc.exe" == "vbc.exe" and "csc.exe" ~= "csc.exe") or not false then
    return mp.CLEAN
  end
  if not (this_sigattrlog[5]).matched and not (this_sigattrlog[7]).matched then
    return mp.CLEAN
  end
  local l_0_10 = nil
  local l_0_11 = nil
  if (bm.get_current_process_startup_info)() and ((bm.get_current_process_startup_info)()).image_path then
    local l_0_12 = {"\\msbuild.exe", "\\devenv.exe", "\\dotnet.exe", "\\visual studio\\", "\\jetbrains\\", "\\rider\\", "\\nuget.exe", "\\omnisharp", "\\roslyn\\", "\\microsoft.net\\framework", "\\servicehub"}
    for l_0_16,l_0_17 in ipairs(l_0_12) do
      local l_0_13, l_0_14 = , (string.lower)(((bm.get_current_process_startup_info)()).image_path)
      -- DECOMPILER ERROR at PC114: Confused about usage of register: R10 in 'UnsetPending'

      if (string.find)(l_0_14, "\\nuget.exe", 1, true) then
        return mp.CLEAN
      end
    end
  end
  do
    if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
      local l_0_18 = nil
      local l_0_19 = (string.lower)((this_sigattrlog[5]).utf8p1)
      local l_0_20 = {"\\users\\", "\\temp\\", "\\tmp\\", "\\downloads\\", "\\desktop\\", "\\appdata\\", "\\public\\", "\\windows\\temp\\"}
      for l_0_24,l_0_25 in ipairs(l_0_20) do
        local l_0_21 = false
        -- DECOMPILER ERROR at PC159: Confused about usage of register: R12 in 'UnsetPending'

        if (string.find)(l_0_19, "\\appdata\\", 1, true) then
          l_0_21 = true
          break
        end
      end
      do
        do
          -- DECOMPILER ERROR at PC169: Confused about usage of register: R7 in 'UnsetPending'

          if not l_0_21 then
            return mp.CLEAN
          end
          ;
          (bm.add_related_string)("cad_output", l_0_19, bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("cad_compiler", l_0_10, bm.RelatedStringBMReport)
          ;
          (bm.add_related_string)("cad_cmdline", l_0_9, bm.RelatedStringBMReport)
          add_parents()
          TrackPidAndTechniqueBM("BM", "T1127.001", "SuspCompileAfterDelivery.B")
          return mp.INFECTED
        end
      end
    end
  end
end

