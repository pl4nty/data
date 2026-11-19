-- Threat: !InfrastructureShared
-- Name: 3b2972bd002e
-- Type: 21

local l_0_0 = mp.getfilename()
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
local l_0_1 = {
  "/var/lib/puppet/client_data/catalog/",
  "/mdatp-fullscan.sh",
  "/clamav-",
  "/.bash_history",
  "/.bash_aliases",
  "/.command_history",
  "/.zsh_history",
  "/testing_mdatp.sh"
}
for l_0_2, l_0_3 in ipairs(l_0_1) do
  if string.find(l_0_0, l_0_3, 1, true) then
    return mp.CLEAN
  end
end
return mp.INFECTED
