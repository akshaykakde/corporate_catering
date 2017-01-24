var options = {
  view: view,                  //View function to render table rows.
  data_url: 'data/data.json',  //Data fetching url
  stream_after: 2,             //Start streaming after 2 secs
  fetch_data_limit: 500,       //Streaming data in batch of 500 
} 

var st = StreamTable('#stream_table', options, data);