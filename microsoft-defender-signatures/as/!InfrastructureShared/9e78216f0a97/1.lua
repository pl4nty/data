-- Threat: !InfrastructureShared
-- Name: 9e78216f0a97
-- Type: 21

if hstrlog[5].matched then
  mp.set_mpattribute("Lowfi:Komodia:LSP:NoVuln")
  return mp.CLEAN
end
return mp.INFECTED
