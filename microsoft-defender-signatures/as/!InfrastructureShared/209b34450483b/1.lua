-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\209b34450483b\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC19: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[9]).matched and (this_sigattrlog[9]).utf8p1 ~= nil then
    local l_0_0 = nil
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  local l_0_3, l_0_4 = , pcall(mp.ContextualExpandEnvironmentVariables, l_0_0)
  if l_0_4 then
    l_0_3 = 
    local l_0_1 = nil
  end
  do
    l_0_3 = (string.lower)(l_0_3)
    local l_0_2 = nil
    local l_0_5 = l_0_3:match("([^\\]+)$")
    if isnull(l_0_5) then
      return mp.CLEAN
    end
    local l_0_6 = {}
    -- DECOMPILER ERROR at PC56: No list found for R4 , SetList fails

    -- DECOMPILER ERROR at PC57: Overwrote pending register: R5 in 'AssignReg'

    -- DECOMPILER ERROR at PC58: Overwrote pending register: R6 in 'AssignReg'

    -- DECOMPILER ERROR at PC59: Overwrote pending register: R7 in 'AssignReg'

    if not ("dbghelp.dll")("winhttp.dll", "dbgcore.dll") then
      return mp.CLEAN
    end
    if not (mp.IsKnownFriendlyFile)(l_0_3, true, false) then
      do
        do
          if (sysio.IsFileExists)(l_0_3) then
            local l_0_7 = (sysio.GetFileSize)(l_0_3)
            if l_0_7 < 20000000 then
              (bm.add_related_file)(l_0_3)
            end
          end
          ;
          (bm.add_related_string)("DLLSearchHijacking", tostring(l_0_3), bm.RelatedStringBMReport)
          do return mp.INFECTED end
          do return mp.CLEAN end
          -- WARNING: undefined locals caused missing assignments!
        end
      end
    end
  end
end

