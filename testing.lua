local AFS = {}
local RemoteFolder = game:GetService("ReplicatedStorage").Remote
local PetFolder = game:GetService("Players").LocalPlayer.PlayerGui.MainGui.Pets.Main.Scroll
local EggArguments = {
    [1] = workspace.Worlds.OnePiece.OnePieceEgg,
    [2] = 1
}

function AFS:AutoSell(pet1, pet2, pet3)
    for i,v in pairs(PetFolder:GetChildren()) do
        if v:IsA("ImageButton") then
            if v.PetName.Text == pet1 or v.PetName.Text == pet2 or v.PetName.Text == pet3 then
                local args2 = {
                    [1] = v.UID.Value,
                    [2] = "MakeGold"
                }
                local args = {
                    [1] = v.UID.Value,
                    [2] = "Sell"
                }
                
                game:GetService("ReplicatedStorage").Remote.ManagePet:FireServer(unpack(args2))
                game:GetService("ReplicatedStorage").Remote.ManagePet:FireServer(unpack(args))
            end
        end
    end
end

function AFS:AutoSell()
    RemoteFolder.OpenEgg:InvokeServer(unpack(EggArguments))
end

return AFS
