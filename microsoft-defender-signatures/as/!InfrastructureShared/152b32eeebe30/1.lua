-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\152b32eeebe30\1.luac 

-- params : ...
-- function num : 0
-- DECOMPILER ERROR at PC12: Overwrote pending register: R0 in 'AssignReg'

do
  if (this_sigattrlog[5]).matched and (this_sigattrlog[5]).utf8p1 ~= nil then
    local l_0_0, l_0_1 = nil
  end
  -- DECOMPILER ERROR at PC14: Confused about usage of register: R0 in 'UnsetPending'

  if isnull(l_0_0) then
    return mp.CLEAN
  end
  -- DECOMPILER ERROR at PC23: Confused about usage of register: R0 in 'UnsetPending'

  do
    local l_0_2 = (string.lower)(l_0_0)
    l_0_2 = l_0_2:match("imagename:([^;]+)")
    if isnull(l_0_2) then
      return mp.CLEAN
    end
    l_0_2 = "\\" .. l_0_2
    for l_0_6 = 1, mp.SIGATTR_LOG_SZ do
      if (sigattr_tail[l_0_6]).matched and (sigattr_tail[l_0_6]).attribute == 16400 then
        local l_0_7 = (sigattr_tail[l_0_6]).utf8p1
        if l_0_2 ~= nil and l_0_2 ~= "" then
          l_0_7 = (string.lower)(l_0_7)
          if (string.find)(l_0_7, l_0_2, 1, true) then
            local l_0_8 = {}
            -- DECOMPILER ERROR at PC95: No list found for R6 , SetList fails

            -- DECOMPILER ERROR at PC96: Overwrote pending register: R7 in 'AssignReg'

            -- DECOMPILER ERROR at PC97: Overwrote pending register: R8 in 'AssignReg'

            -- DECOMPILER ERROR at PC98: Overwrote pending register: R9 in 'AssignReg'

            if ("powershell")("rundll32", "msiexec") then
              return mp.INFECTED
            end
          end
        end
      end
    end
    do return mp.CLEAN end
    -- WARNING: undefined locals caused missing assignments!
  end
end

