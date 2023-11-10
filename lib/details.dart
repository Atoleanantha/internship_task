

import 'package:flutter/material.dart';

import 'model.dart';

class DetailsScreen extends StatelessWidget {
   DetailsScreen({super.key,required this.lead});
  Lead lead;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lead Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Center(child: lead.imageURL.isNotEmpty ? const CircleAvatar(radius: 40,child: Icon(Icons.person,size: 60,),):const CircleAvatar(child: Icon(Icons.person_add_alt_1),)),
              const SizedBox(height: 20,),
              Text("NAME : ${lead.firstName} ${lead.lastName}" ,style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              Text("Id : ${lead.id}",style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              Text("NOTARY ID : ${lead.notaryId}",style:const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
              const SizedBox(height: 5,),
              Text("EMAIL: ${lead.email}", style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("PHONE NUMBER : ${lead.phoneNumber}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("BIO : ${lead.bio}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("CREATED AT : ${lead.createdAt.toString().substring(0,10)}  TIME:${lead.createdAt.toString().substring(11,16)} ",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("INVOICE ADDRESS : ${lead.invoiceAddress}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("INVOICE DUE COUNT : ${lead.invoiceDueCount}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("INVOICE COLLECTED MONTH  : ${lead.invoiceCollectedThisMonth}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("INVOICE COLLECTED SO FAR  : ${lead.invoiceCollectedSoFar}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("TOTAL INVOICE : ${lead.totalInvoice}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("COMPLETED APPTS  : ${lead.completedAppts}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("CITY : ${lead.city}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("STATE : ${lead.state}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              Text("ZIP : ${lead.zipCode}",style:const TextStyle(fontSize: 16,),),
              const SizedBox(height: 5,),
              const Text("NOTES : ",style:TextStyle(fontSize: 16,),),
              lead.notes.isEmpty? const Text("        Not Available"): SizedBox(
                height: 50,
                child:ListView.builder(
                    itemCount: lead.notes.length,
                    itemBuilder: (context,index){
                      return Text(lead.notes[index],style:const TextStyle(fontSize: 16,),);
                    }),
              ),
              const SizedBox(height: 5,),
              const Text("KNOWN CONTACTS : ",style:TextStyle(fontSize: 16,),),
              lead.knownContacts.isEmpty? const Text("        Not Available"): SizedBox(
                height: 50,
                child:ListView.builder(
                    itemCount: lead.knownContacts.length,
                    itemBuilder: (context,index){
                      return Text(lead.knownContacts[index],style:const TextStyle(fontSize: 16,),);
                    }),
              ),




            ],
          ),
        ),
      ),
    );
  }
}
