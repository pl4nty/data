-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32GracingMK\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.get_mpattributevalue)("RPF:GoLang:pclntab_magic_unknown")
if isnull(l_0_0) then
  return mp.CLEAN
end
do
  local l_0_1 = {}
  -- DECOMPILER ERROR at PC17: No list found for R1 , SetList fails

  -- DECOMPILER ERROR at PC18: Overwrote pending register: R2 in 'AssignReg'

  -- DECOMPILER ERROR at PC19: Overwrote pending register: R3 in 'AssignReg'

  for l_0_5,l_0_6 in (4294967280)(4294967291) do
    if (mp.bitand)(l_0_0, l_0_6) ~= l_0_6 then
      local l_0_7, l_0_8 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_FILEPATH)
      if l_0_7 and not isnull(l_0_8) then
        local l_0_9 = (MpCommon.PathToWin32Path)(l_0_8)
        if isnull(l_0_9) then
          return mp.CLEAN
        end
        local l_0_10 = {}
        -- DECOMPILER ERROR at PC66: No list found for R10 , SetList fails

        local l_0_11 = false
        -- DECOMPILER ERROR at PC68: Overwrote pending register: R12 in 'AssignReg'

        -- DECOMPILER ERROR at PC69: Overwrote pending register: R13 in 'AssignReg'

        for l_0_15,l_0_16 in ("^%a:\\program files %(x86%)\\")("^%a:\\programdata\\microsoft\\") do
          if (string.find)(l_0_9, l_0_16) then
            break
          end
        end
        do
          do
            if not l_0_11 then
              if (mp.IsTrustedFile)(false) == true then
                return mp.CLEAN
              end
              return mp.INFECTED
            end
            -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC97: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
  do return mp.CLEAN end
  -- WARNING: undefined locals caused missing assignments!
end

