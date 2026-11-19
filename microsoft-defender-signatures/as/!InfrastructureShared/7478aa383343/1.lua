-- Threat: !InfrastructureShared
-- Name: 7478aa383343
-- Type: 21

local l_0_0 = mp.GetHSTRCallerId()
if mp.HSTR_CALLER_SMS == l_0_0 then
  local l_0_1 = mp.hstr_full_log()
  if l_0_1 ~= nil then
    local l_0_2 = l_0_1[1]
    if l_0_2 ~= nil and l_0_2.VA ~= nil then
      local l_0_3 = l_0_2.match_offsets_ex[1]
      if l_0_3 ~= nil then
        local l_0_4 = l_0_2.VA + l_0_3.offset
        local l_0_5 = mp.ReadProcMem(l_0_4, l_0_3.size)
        if l_0_5 ~= nil then
          local l_0_6 = tostring(l_0_5)
          if l_0_6 ~= nil and #l_0_6 == 66 and l_0_6:match("^[a-f0-9]+$") then
            local l_0_7 = "050cd3b29c9076990738737a0a4f1920e058a543a462864a60e23ec964fd308712"
            if #l_0_7 == #l_0_6 and l_0_6 ~= l_0_7 then
              return mp.INFECTED
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
