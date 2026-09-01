-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\2c3b377e4219c\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = {}
-- DECOMPILER ERROR at PC15: No list found for R0 , SetList fails

-- DECOMPILER ERROR at PC16: Overwrote pending register: R1 in 'AssignReg'

local l_0_1 = "^ntsvcs_?%x%x$"
-- DECOMPILER ERROR at PC17: Overwrote pending register: R2 in 'AssignReg'

do
  local l_0_2 = "^scerpc_?%x%x$"
  -- DECOMPILER ERROR at PC18: Overwrote pending register: R3 in 'AssignReg'

  -- DECOMPILER ERROR at PC19: Overwrote pending register: R4 in 'AssignReg'

  -- DECOMPILER ERROR at PC21: Overwrote pending register: R5 in 'AssignReg'

  for l_0_6 = "^spoolss_%x%x$", ("^rpc_%x%x$").SIGATTR_LOG_SZ, "^msrpc_%x%x%x%x$" do
    -- DECOMPILER ERROR at PC23: Overwrote pending register: R7 in 'AssignReg'

    local l_0_7 = ("^searchtextharvester%x%x$")[l_0_6]
    -- DECOMPILER ERROR at PC25: Overwrote pending register: R8 in 'AssignReg'

    -- DECOMPILER ERROR at PC32: Overwrote pending register: R9 in 'AssignReg'

    if "^pgmessagepipe%x%x$" and l_0_7.attribute == 16560 then
      do
        do
          local l_0_8 = l_0_1("^msftewds%x%x$")
          -- DECOMPILER ERROR at PC35: Overwrote pending register: R10 in 'AssignReg'

          -- DECOMPILER ERROR at PC36: Overwrote pending register: R11 in 'AssignReg'

          if contains("^mypipe%-[fh]%x%x$", "^fullduplex_%x%x$", false) then
            break
          end
          -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out DO_STMT

          -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC43: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
  end
  if l_0_2 == nil then
    return mp.CLEAN
  end
  do return mp.INFECTED end
  -- WARNING: undefined locals caused missing assignments!
end

