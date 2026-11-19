-- Threat: !InfrastructureShared
-- Name: b9d7ac357664
-- Type: 21
-- Includes: ResearchData

local l_0_0 = sysio.RegExpandUserKey("HKCU\\Environment")
if l_0_0 then
  for l_0_1, l_0_2 in pairs(l_0_0) do
    if string.find(string.lower(l_0_2), "hkcu@s-1-5-21-", 1, true) then
      local l_0_3 = sysio.RegOpenKey(l_0_2)
      if l_0_3 then
        local l_0_4 = sysio.GetRegValueAsString(l_0_3, "COR_PROFILER")
        if l_0_4 then
          local l_0_5 = sysio.GetRegValueAsString(l_0_3, "COR_PROFILER_PATH")
          if l_0_5 then
            set_research_data("cor_prof_path", l_0_5, false)
            return mp.INFECTED
          end
          local l_0_6 = string.match(l_0_2, "(HKCU.-)\\")
          if l_0_6 then
            local l_0_7 = l_0_6 .. "\\Software\\Classes\\CLSID\\" .. l_0_4 .. "\\InprocServer32"
            local l_0_8 = sysio.RegOpenKey(l_0_7)
            if l_0_8 then
              local l_0_9 = sysio.GetRegValueAsString(l_0_8, "")
              if l_0_9 then
                if string.len(l_0_9) < 4 and string.lower(l_0_9) ~= "cmd" then
                  return mp.CLEAN
                end
                set_research_data("inprocserver32", l_0_9, false)
                mp.set_mpattribute("MpDisableCaching")
                return mp.INFECTED
              end
            end
          end
        end
      end
    end
  end
end
return mp.CLEAN
