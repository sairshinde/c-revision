train=read.csv("/home/sunbeam/Downloads/Train_UWu5bXk.csv")
columns=colnames(train)
#Missing Values....

for(column in columns){
  if(TRUE %in% is.na(train[column]))
  {

    train[,column]=ifelse(is.na(train[,column]),mean(train[,column],na.rm = TRUE),train$Item_Weight)
  }
 
}
#Data Consistancy  -------------------Item_Fat_Content
train$Item_Fat_Content=as.character(train$Item_Fat_Content)
train$Item_Fat_Content=ifelse(train$Item_Fat_Content == "LF","Low Fat",train$Item_Fat_Content)
train$Item_Fat_Content=ifelse(train$Item_Fat_Content == "low fat","Low Fat",train$Item_Fat_Content)
train$Item_Fat_Content=ifelse(train$Item_Fat_Content == "reg","Regular",train$Item_Fat_Content)
unique(train$Item_Fat_Content)

#--------------------------------------------------------
train$Outlet_Size=as.character(train$Outlet_Size)
train$Outlet_Size=ifelse(train$Outlet_Size == "","Medium",train$Outlet_Size)
table(train$Outlet_Size)
train$Outlet_Size=as.factor(train$Outlet_Size)
