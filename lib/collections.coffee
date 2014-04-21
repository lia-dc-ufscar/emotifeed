root = global ? window

root.Messages = new Meteor.Collection "messages"
root.History = new Meteor.Collection "history"
root.QRCodeUsage = new Meteor.Collection "qrcodeusage"