-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\Unknowcategory\80a_466.luac 

-- params : ...
-- function num : 0
local l_0_0 = Remediation.Threat
if l_0_0.Active and (string.match)(l_0_0.Name, "Behavior:Win32/MaleficAms.I") then
  for l_0_4,l_0_5 in ipairs((Remediation.Threat).Resources) do
    if l_0_5.Schema == "behavior" then
      local l_0_6 = (string.match)(l_0_5.Path, "process: (%a:\\[^,]+%.exe)")
      if l_0_6 and (sysio.IsFileExists)(l_0_6) then
        do
          do
            (sysio.DeleteFile)(l_0_6)
            do break end
            -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out IF_STMT

            -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC39: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
  end
end

