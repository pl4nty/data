-- Threat: !InfrastructureShared
-- Name: 1e6b3580aeafd
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[10].matched then
  l_0_0 = this_sigattrlog[10].utf8p1
  local l_0_1 = l_0_0:match("([^\\]+)$") or ""
  local l_0_2, l_0_3 = l_0_1:match("^(.+)%.([^%.]+)$")
  if not l_0_3 or not contains(string.lower(l_0_3), {"exe", "dll"}) then
    return mp.CLEAN
  end
end
if not l_0_0 then
  return mp.CLEAN
end
local l_0_4, l_0_5 = bm.get_process_relationships()
if l_0_4 then
  for l_0_6, l_0_7 in ipairs(l_0_4) do
    if l_0_7.reason == bm.RELATIONSHIP_INJECTION then
      if l_0_7.image_path and contains(l_0_7.image_path, "wbem\\WmiPrvSE.exe") then
        local l_0_8 = bm.get_current_process_startup_info()
        if l_0_8 and l_0_8.ppid then
          local l_0_9 = mp.GetProcessCommandLine(l_0_8.ppid) or ""
          if contains(l_0_9, "svchost.exe -k secsvcs") then
            return mp.CLEAN
          end
        end
      end
      bm.add_related_string("InjectedBy", l_0_7.image_path or "", bm.RelatedStringBMReport)
      bm.add_related_string("File_Created", l_0_0, bm.RelatedStringBMReport)
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
