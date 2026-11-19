-- Threat: !InfrastructureShared
-- Name: 35b3059adebc
-- Type: 21

local l_0_0, l_0_1 = bm.get_process_relationships()
local l_0_2, l_0_3
for l_0_4, l_0_5 in ipairs(l_0_0) do
  if l_0_5.image_path ~= nil then
    local l_0_6 = mp.bitand(l_0_5.reason_ex, 1)
    if l_0_6 == 1 then
      l_0_2 = string.lower(l_0_5.image_path)
      if l_0_2:find("excel.exe") or l_0_2:find("winword.exe") then
        l_0_3 = string.lower(mp.GetProcessCommandLine(l_0_5.ppid))
        if string.find(l_0_3, "rs4_winatp-intro-invoice", 1, true) or string.find(l_0_3, "onboardingwindows11tomicrosoftdefender", 1, true) then
          return mp.CLEAN
        end
        return mp.INFECTED
      end
    end
  end
end
return mp.CLEAN
